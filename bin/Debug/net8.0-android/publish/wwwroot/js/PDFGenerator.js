

//function DownloadPdf(fileName, byteBase64) {
//    var.link = document.createElement('a');
//    link.download = fileName;
//    link.href = "data:application/octet-stream;base64," + byteBase64;
//    document.body.appendChild(link);
//    link.click();
//    document.body.removeChild(link);
//}


//function DownloadPdf(fileName, byteBase64) {
//    var link = document.createElement('a');
//    link.download = fileName;
//    link.href = "data:application/octet-stream;base64," + byteBase64;
//    document.body.appendChild(link);
//    link.click();
//    document.body.removeChild(link);
//}

function DownloadPdf(fileName, byteBase64) {
    try {
        console.log("WTF")
        var link = document.createElement('a');
        link.download = fileName;
        link.href = "data:application/octet-stream;base64," + byteBase64;
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    } catch (error) {
        console.error("Error in DownloadPdf function:", error);
    }
}
