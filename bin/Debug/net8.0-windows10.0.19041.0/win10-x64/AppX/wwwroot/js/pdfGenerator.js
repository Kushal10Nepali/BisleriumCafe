
//window.generatePDF = function () {
//    if (typeof jsPDF !== 'undefined') {
//        var doc = new jsPDF();
//        doc.text("Hello world!", 10, 10);
//        doc.save("report.pdf");
//    } else {
//        console.error("jsPDF is not defined. Make sure the library is correctly loaded.");
//    }
//}

function DownloadPdf(fileName, byteBase64) {
    var.link = document.createElement('a');
    link.download = fileName;
    link.href = "data:application/octet-stream;base64," + byteBase64;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}
