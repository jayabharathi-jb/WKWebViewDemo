window.onload = function() {
    alert("onload called")
    window.webkit.messageHandlers.sizeNotification.postMessage({width: document.width, height: document.body.scrollHeight})
}
