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
var request = http.MultipartRequest('POST', Uri.parse('http://0.0.0.0:8080/upload_images?usr_1x=83.41027154663527&usr_1y=159.08441558441564&usr_2x=831.4622195985835&usr_2y=149.11038961038957&usr_3x=848.08559622196&usr_3y=1103.2922077922078&usr_4x=85.07260920897295&usr_4y=1118.2532467532467&map_1x=538.1351829988198&map_1y=205.62987012987014&map_2x=917.1481700118065&map_2y=569.6818181818181&map_3x=385.20011806375487&map_3y=1073.3701298701299&map_4x=32.78453364817028&map_4y=642.8246753246754'));

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
