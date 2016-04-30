<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="WebApplication1.WebForm3" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="masthead">
	    <h3 class="text-muted">Manage Users</h3>
	</div>
	
	<p>
        <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="Users">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('Are you sure you want to delete?')" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Users"  runat="server" ConflictDetection="CompareAllValues" ConnectionString="Data Source=tcp:taskserv.database.windows.net,1433;Initial Catalog=ToDoTaskList_db;User ID=cs435@taskserv;Password=hello123!;Connect Timeout=30;Encrypt=True;TrustServerCertificate=False" DeleteCommand="DELETE FROM [AspNetUsers] WHERE [Id] = @original_Id AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" InsertCommand="INSERT INTO [AspNetUsers] ([Id], [Email]) VALUES (@Id, @Email)" OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Id], [Email] FROM [AspNetUsers]" UpdateCommand="UPDATE [AspNetUsers] SET [Email] = @Email WHERE [Id] = @original_Id AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="original_Id" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script src="Scripts/list.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=GridView1]').footable();
        });
    </script>
</asp:Content>
