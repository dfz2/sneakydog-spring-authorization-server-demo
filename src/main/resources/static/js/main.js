$(function () {

    $(document).ajaxStart(()=>Pace.restart());

    let token = $("meta[name='_csrf']").attr("content");
    $.ajaxSetup({
        cache: false,
        beforeSend: function (jqXHR, settings) {
            settings.url += settings.url.match(/\?/) ? "&" : "?";
            settings.url += "_t=" + new Date().getTime();
        },
        headers: {
            "X-XSRF-TOKEN": token
        },
        xhrFields: {
            withCredentials: true
        },
        complete: function (xhr, status) {
            console.log(xhr)
            console.log(status)
            if (xhr.status === 401) {
                parent.location.href = baseURL + "login";
            }
        }
    });





});

