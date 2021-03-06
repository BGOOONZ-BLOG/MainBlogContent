---
title: 'FileReader: error event'
slug: Web/API/FileReader/error_event
tags:
  - API
  - Error
  - Event
  - FileReader
  - ProgressEvent
  - Reference
  - Web
  - onerror
browser-compat: api.FileReader.error_event
---
{{APIRef}}

The `error` event is fired when the read failed due to an error (for example, because the file was not found or not readable).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Bubbles</th>
      <td>No</td>
    </tr>
    <tr>
      <th scope="row">Cancelable</th>
      <td>No</td>
    </tr>
    <tr>
      <th scope="row">Interface</th>
      <td>{{domxref("ProgressEvent")}}</td>
    </tr>
    <tr>
      <th scope="row">Event handler property</th>
      <td>{{domxref("FileReader.onerror")}}</td>
    </tr>
  </tbody>
</table>

## Examples

```js
const fileInput = document.querySelector('input[type="file"]');
const reader = new FileReader();

function handleSelected(e) {
    const selectedFile = fileInput.files[0];
    if (selectedFile) {

        reader.addEventListener('error', () => {
            console.error(`Error occurred reading file: ${selectedFile.name}`);
        });

        reader.addEventListener('load', () => {
            console.error(`File: ${selectedFile.name} read successfully`);
        });

        reader.readAsDataURL(selectedFile);
    }
}

fileInput.addEventListener('change', handleSelected);
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- Related events: {{domxref("FileReader.loadstart_event", "loadstart")}}, {{domxref("FileReader.loadend_event", "loadend")}}, {{domxref("FileReader.progress_event", "progress")}}, {{domxref("FileReader.load_event", "load")}}, {{domxref("FileReader.abort_event", "abort")}}
