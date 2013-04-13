<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HitCounter.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/jquery.signalR-1.0.1.min.js"></script>
    <script>
        $(function () {
            var connection = $.hubConnection();
            var hitCounter = connection.createHubProxy("hitcounter");

            hitCounter.on("showHitCount", function (count) {
                $("#counter").text(count + "いいね");
            });

             $("#hit").click(function () {
                hitCounter.invoke("HitCount");
            });

            connection.start(function () {
                $("#hit").prop("disabled", false);
            })
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="counter"></div>
        <input type="button" id="hit" value="いいね" disabled="disabled"/>
    </div>
    </form>
</body>
</html>
