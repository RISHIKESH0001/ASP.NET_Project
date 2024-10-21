<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sheetupload.aspx.cs" Inherits="Project.NET.Sheetupload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RESULT UPLOAD</title>
    <script type="text/javascript">
    function previewCSVFile(input) {
        var file = input.files[0];
        if (file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                var text = e.target.result;
                displayCSVPreview(text);
            };
            reader.readAsText(file);
        }
    }

    function displayCSVPreview(text) {
        // Split the CSV content into lines
        var lines = text.split("\n");

        // Get the table header and body elements
        var previewHeader = document.getElementById("previewHeader");
        var previewBody = document.getElementById("previewBody");

        // Clear any existing content
        previewHeader.innerHTML = "";
        previewBody.innerHTML = "";

        if (lines.length > 0) {
            // Create table header from the first row (assuming it's the header)
            var headers = lines[0].split(",");
            var headerRow = document.createElement("tr");
            for (var i = 0; i < headers.length; i++) {
                var th = document.createElement("th");
                th.innerHTML = headers[i];
                headerRow.appendChild(th);
            }
            previewHeader.appendChild(headerRow);

            // Create table rows for the remaining lines
            for (var j = 1; j < lines.length; j++) {
                var row = document.createElement("tr");
                var cells = lines[j].split(",");
                for (var k = 0; k < cells.length; k++) {
                    var td = document.createElement("td");
                    td.innerHTML = cells[k];
                    row.appendChild(td);
                }
                previewBody.appendChild(row);
            }
        }
    }
    </script>
    <style type="text/css">
    #previewTable {
        margin-top: 20px;
        border-collapse: collapse;
        width: 100%;
    }

    #previewTable th, #previewTable td {
        border: 1px solid #ddd;
        padding: 8px;
    }

    #previewTable th {
        background-color: #f2f2f2;
        text-align: left;
    }
</style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="FileUploadCSV" runat="server" OnChange="previewCSVFile(this)" />
<asp:Button ID="btnUpload" Text="Upload CSV" OnClick="btnUpload_Click" runat="server" />

<!-- Preview Table -->
<table id="previewTable" border="1">
    <thead id="previewHeader"></thead>
    <tbody id="previewBody"></tbody>
</table>

        </div>
    </form>
</body>
</html>
