//using iTextSharp.text;
//using iTextSharp.text.pdf;
//using Microsoft.JSInterop;
//using System;
//using System.IO;
//using System.Threading.Tasks;
//using Element = iTextSharp.text.Element;
//using Font = iTextSharp.text.Font;

//namespace BisleriumCafe.PDF
//{
//    public class PDFGenerator
//    {
//        public async Task DownloadPdf(IJSRuntime js, string fileName = "report.pdf")
//        {
//            byte[] pdfBytes = PDFReport();
//            await js.InvokeVoidAsync("saveAsFile", fileName, Convert.ToBase64String(pdfBytes));
//        }

//        private byte[] PDFReport()
//        {
//            using (MemoryStream memoryStream = new MemoryStream())
//            {
//                float marginLeft = 1.5f;
//                float marginRight = 1.5f;
//                float marginTop = 1.0f;
//                float marginBottom = 1.0f;

//                Document pdf = new Document(
//                    PageSize.A4,
//                    marginLeft,
//                    marginRight,
//                    marginTop,
//                    marginBottom);

//                pdf.AddTitle("Blazor PDF");
//                pdf.AddAuthor("Author");
//                pdf.AddCreationDate();
//                pdf.AddKeywords("Blazor");
//                pdf.AddSubject("Author");

//                PdfWriter writer = PdfWriter.GetInstance(pdf, memoryStream);

//                // Header
//                var fontStyle = FontFactory.GetFont("Arial", 16, BaseColor.White);
//                var labelHeader = new Chunk("Blazor Pdf header", fontStyle);

//                HeaderFooter header = new HeaderFooter(new Phrase(labelHeader), false)
//                {
//                    BackgroundColor = new BaseColor(50, 20, 120),
//                    Alignment = Element.ALIGN_CENTER,
//                    Border = Rectangle.NO_BORDER
//                };

//                pdf.Header = header;

//                // Create Body
//                pdf.Open();

//                var title = new Paragraph("Test", new Font(Font.HELVETICA));
//                title.SpacingAfter = 18f;

//                pdf.Add(title);

//                Font _fontStyle = FontFactory.GetFont("Tahoma", 12f, Font.NORMAL);

//                var _mytext = "Bislerium Cafe";
//                var phrase = new Phrase(_mytext, _fontStyle);
//                pdf.Add(phrase);

//                pdf.Close();

//                return memoryStream.ToArray();
//            }
//        }
//    }
//}


using iTextSharp.text;
using iTextSharp.text.pdf;
using Microsoft.JSInterop;
using System;
using System.IO;
using System.Threading.Tasks;
using Element = iTextSharp.text.Element;
using Font = iTextSharp.text.Font;

namespace BisleriumCafe.PDF
{
    public class PDFGenerator
    {
        public async Task DownloadPdf(IJSRuntime js, string fileName = "report.pdf")
        {
            byte[] pdfBytes;
            try
            {
                pdfBytes = PDFReport();
                await js.InvokeVoidAsync("saveAsFile", fileName, Convert.ToBase64String(pdfBytes));
            }
            catch (Exception ex)
            {
                // Handle or log the exception
                Console.WriteLine($"Error generating PDF: {ex.Message}");
            }
        }

        private byte[] PDFReport()
        {
            using (MemoryStream memoryStream = new MemoryStream())
            {
                float marginLeft = 1.5f;
                float marginRight = 1.5f;
                float marginTop = 1.0f;
                float marginBottom = 1.0f;

                Document pdf = new Document(
                    PageSize.A4,
                    marginLeft,
                    marginRight,
                    marginTop,
                    marginBottom);

                pdf.AddTitle("Blazor PDF");
                pdf.AddAuthor("Author");
                pdf.AddCreationDate();
                pdf.AddKeywords("Blazor");
                pdf.AddSubject("Author");

                PdfWriter writer = PdfWriter.GetInstance(pdf, memoryStream);

                // Header
                var fontStyle = FontFactory.GetFont("Arial", 16, BaseColor.White);
                var labelHeader = new Chunk("Blazor Pdf header", fontStyle);

                HeaderFooter header = new HeaderFooter(new Phrase(labelHeader), false)
                {
                    BackgroundColor = new BaseColor(50, 20, 120),
                    Alignment = Element.ALIGN_CENTER,
                    Border = Rectangle.NO_BORDER
                };

                pdf.Header = header;

                // Create Body
                pdf.Open();

                var title = new Paragraph("Test", new Font(Font.HELVETICA));
                title.SpacingAfter = 18f;

                pdf.Add(title);

                Font _fontStyle = FontFactory.GetFont("Tahoma", 12f, Font.NORMAL);

                var _mytext = "Bislerium Cafe";
                var phrase = new Phrase(_mytext, _fontStyle);
                pdf.Add(phrase);

                pdf.Close();

                return memoryStream.ToArray();
            }
        }
    }
}
