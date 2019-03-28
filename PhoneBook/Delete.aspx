<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="PhoneBook.Delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
    <div class="textAlign">
        <br />
        <div class="textAlign">
        <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Height="240px" Width="900px" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="ID">
            <Columns>
                <asp:TemplateField HeaderText="刪除">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButtonDelete" runat="server"
                            CausesValidation="false" CommandName="Delete"
                            OnClientClick="return confirm('您確定要刪除此筆資料？');"
                            Style="position: static">刪除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
        <br />
                    <asp:Button ID="ButtonDelete" runat="server" BackColor="Red" Font-Size="Medium" ForeColor="White" Height="37px" Text="Back" Width="80px" OnClick="ButtonDelete_Click" />
    </div>
</asp:Content>