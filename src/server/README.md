# Coregistration Server

This server performs the coregistration process asynchronously.

## API Routes

### `/upload_images`

This route allows to get the coregistered image by making a `POST` request. Here are the details of the request:

- **Method:** `POST`
- **Content-Type:** `multipart/form-data`
- **Body Parameters:**
    - `user_image`: The user photo of a hiking trail.
    - `map_image`: The screenshot of a map on which the user photo should be aligned.

Upon receiving the request, the server performs the coregistration process and returns the resulting image in the response body.

## Example of a request in `Dart - http`:

```dart
var headers = {
  'Content-Type': 'multipart/form-data'
};
var request = http.MultipartRequest('POST', Uri.parse('http://127.0.0.1:8080/upload_images'));

request.files.add(await http.MultipartFile.fromPath('user_image', '/DCIM/Camera/picture1.JPG'));
request.files.add(await http.MultipartFile.fromPath('map_image', '/DCIM/Screenshots/picture2.JPG'));
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}
```
