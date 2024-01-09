//window.generatePDF = function () {
//    var doc = new jsPDF();
//    doc.text("Hello world!", 10, 10);
//    doc.save("report.pdf");
//}

window.generatePDF = function () {
    if (typeof jsPDF !== 'undefined') {
        var doc = new jsPDF();
        doc.text("Hello world!", 10, 10);
        doc.save("report.pdf");
    } else {
        console.error("jsPDF is not defined. Make sure the library is correctly loaded.");
    }
}
