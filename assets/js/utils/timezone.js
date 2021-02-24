export default function sendTimezoneToServer() {
    const timezone = - (new Date().getTimezoneOffset() / 60);
    let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")


    if (typeof window.localStorage != 'undefined') {
        try {
            if (!localStorage["timezone"] || localStorage["timezone"].toString() != timezone.toString()) {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", '/api/session/set-timezone', true);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.setRequestHeader("x-csrf-token", csrfToken);
                xhr.onreadystatechange = function () {
                    if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
                        localStorage['timezone'] = timezone.toString();
                    }
                };
                xhr.send(`{"timezone": ${timezone}}`);
            }
        } catch (e) { }
    }
}