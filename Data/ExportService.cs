using iTextSharp.text;
using iTextSharp.text.pdf;
using Microsoft.JSInterop;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;
using Document = iTextSharp.text.Document;
using Element = iTextSharp.text.Element;

namespace BisleriumCafe.Data
{
    public class ExportService
    {
        public void DownloadPdf(IJSRuntime js, string fileName = "report.pdf")
        {
            js.InvokeVoidAsync("DownloadPdf", fileName, Convert.ToBase64String(PDFReport()));
        }

        private byte[] PDFReport()
        {
            var memoryStream = new MemoryStream();
            float margeLeft = 1.5f;
            float margeRight = 1.5f;
            float margeTop = 1.0f;
            float margeBottom = 1.0f;


            Document pdf = new Document(
                PageSize.A4,
                margeLeft,
                margeRight,
                margeTop,
                margeBottom);



            pdf.AddTitle("Blazor PDF");
            pdf.AddAuthor("Author");
            pdf.AddCreationDate();
            pdf.AddKeywords("Blazor");
            pdf.AddSubject("Author");


            PdfWriter writer = PdfWriter.GetInstance(pdf, memoryStream);

            ////HEader 
            var fontStyle = FontFactory.GetFont("Arial", 16, BaseColor.White);
            var labelHeader = new Chunk("Blazor Pdf header", fontStyle);

            HeaderFooter header = new HeaderFooter(new Phrase(labelHeader), false)
            {
                BackgroundColor=new BaseColor(50, 20, 120),
                Alignment = Element.ALIGN_CENTER,
                Border = Rectangle.NO_BORDER
            };

            pdf.Header = header;

            ////Create Body
            pdf.Open();

            var title = new Paragraph("Test" /*new Font(Font.Default, 20, Font.DefaultBold)*/);
            title.SpacingAfter = 18f;

            pdf.Add(title);

            //Font _fontstyle = FontFactory.GetFont("Tahoma", 12f , Font.NORMAL);

            var _mytext = "Bislerium Cafe";
            var phrase = new Phrase(_mytext/*, _fontStyle*/);
            pdf.Add(phrase);

            pdf.Close();

            return memoryStream.ToArray();
        }

        
    }
}
