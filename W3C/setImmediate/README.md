# setImmediate

THIS DOCUMENT IS NO LONGER UNDER DEVELOPMENT.

This repo defines an interface for web applications to received an immediate callback after the browser's event queue is completely flushed.

This allows a low priority callback to be scheduled that is executed only when there are no active events in any other queue.

setTimeout(0) is used in ~45% of navigations but a review of those uses reveals that only a small percentage of them are required to run at their current priority. setImmediate is an alternative to setTimeout(0) for site developers that are paying close attention to the responsiveness of their page.

Live @

 https://w3c.github.io/setImmediate/
