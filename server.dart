// https://dart.dev/articles/libraries/dart-io#writing-web-servers

import 'dart:io';

Future<void> main() async {
  final script = File(Platform.script.toFilePath());
  await runServer(script.parent.path);
}

Future<void> runServer(String basePath) async {
  print("Serving `web` on http://localhost:8080 , basePath: ${basePath}");

  final server = await HttpServer.bind('localhost', 8080);
  await for (HttpRequest request in server) {
    handleRequest(basePath, request);
  }
}

Future<void> handleRequest(String basePath, HttpRequest request) async {
  final String path = request.uri.toFilePath();
  // PENDING: Do more security checks here.
  final String resultPath = path == '/' ? '/index.html' : path;
  final File file = File('$basePath$resultPath');
  if (await file.exists()) {
    try {
      await file.openRead().pipe(request.response);
    } catch (exception) {
      print('Error happened: $exception');
      await sendInternalError(request.response);
    }
  } else {
    await sendNotFound(request.response);
  }
}

Future<void> sendInternalError(HttpResponse response) async {
  response.statusCode = HttpStatus.internalServerError;
  await response.close();
}

Future<void> sendNotFound(HttpResponse response) async {
  response.statusCode = HttpStatus.notFound;
  await response.close();
}
