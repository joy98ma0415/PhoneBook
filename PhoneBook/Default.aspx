<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PhoneBook._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function getWidth() {
            var intViewportWidth = window.innerWidth;
            var w = window.innerWidth;
            var h = window.innerHeight;
            var ow = window.outerWidth; //including toolbars and status bar etc.
            var oh = window.outerHeight;
            if (window.matchMedia("(min-width: 400px)").matches) {
                /* the viewport is at least 400 pixels wide */
            }
            else {
                /* the viewport is less than 400 pixels wide */
            }
            if (self.innerWidth) {
                return self.innerWidth;
            }
            if (document.documentElement && document.documentElement.clientWidth) {
                return document.documentElement.clientWidth;
            }
            if (document.body) {
                return document.body.clientWidth;
            }
        }
    </script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        $(function () {
            // See if this is a touch device
            if ('ontouchstart' in window) {
                // Set the correct body class
                $('body').removeClass('no-touch').addClass('touch');

                // Add the touch toggle to show text
                $('div.boxInner img').click(function () {
                    $(this).closest('.boxInner').toggleClass('touchFocus');
                });
            }
        });
    </script>

    <asp:Table ID="Table1" runat="server" Height="85" BackColor="Plum"></asp:Table>
    <div>
        <h1 class="textAlign" style="color: #009900">Phone Book Using ASP.NET</h1>
        <p class="textAlign" style="color: #009900">&nbsp;</p>
    </div>
    <div>

        <table align="center" cellpadding="3" cellspacing="3" style="width: 941px">
            <tr>
                <td style="height: 55px; width: 469px" colspan="2">
                    <asp:Label ID="Label1" runat="server" CssClass="style6" Text="Name"></asp:Label>
                </td>
                <td style="height: 55px; width: 469px" colspan="2">
                    <asp:TextBox ID="TextBoxName" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 55px; width: 469px" colspan="2">
                    <asp:Label ID="Label2" runat="server" CssClass="style6" Text="Contact"></asp:Label>
                </td>
                <td style="height: 55px; width: 469px" colspan="2">
                    <asp:TextBox ID="TextBoxContact" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 55px; width: 469px" colspan="2">
                    <asp:Label ID="Label3" runat="server" CssClass="style6" Text="Location"></asp:Label>
                </td>
                <td style="height: 55px; width: 469px" colspan="2">
                    <asp:TextBox ID="TextBoxLocation" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="textAlign" colspan="4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
            <tr>
                <td class="textAlign" style="height: 40px">
                    <asp:Button ID="ButtonAdd" runat="server" BackColor="Red" Font-Size="Medium" ForeColor="White" Height="37px" Text="Add" Width="100px" OnClick="ButtonAdd_Click" />
                </td>
                <td class="textAlign" style="height: 40px">
                    <asp:Button ID="ButtonDelete" runat="server" BackColor="Red" Font-Size="Medium" ForeColor="White" Height="37px" Text="Delete" Width="100px" OnClick="ButtonDelete_Click" />
                </td>
                <td class="textAlign" style="height: 40px">
                    <asp:Button ID="ButtonUpdate" runat="server" BackColor="Red" Font-Size="Medium" ForeColor="White" Height="37px" Text="Update" Width="100px" OnClick="ButtonUpdate_Click" />
                </td>
                <td class="textAlign" style="height: 40px">
                    <asp:Button ID="ButtonSearch" runat="server" BackColor="Red" Font-Size="Medium" ForeColor="White" Height="37px" Text="Search" Width="100px" OnClick="ButtonSearch_Click" />
                </td>
            </tr>
        </table>
    </div>
    <hr style="margin-bottom: 25px" />
    <div>
        <div class="textAlign">
        <asp:GridView ID="GridViewPhoneBook" runat="server" AllowPaging="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" PageSize="5" Width="900px" AutoGenerateColumns="False" Height="240px" CellSpacing="2" DataSourceID="SqlDataSource1" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="編號" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                <asp:BoundField DataField="Contact" HeaderText="連絡電話" SortExpression="Contact" />
                <asp:BoundField DataField="Location" HeaderText="居住城市" SortExpression="Location" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        </div>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="SELECT * FROM [PhoneBook] ORDER BY [ID]"></asp:SqlDataSource>
        <br />
    </div>
</asp:Content>