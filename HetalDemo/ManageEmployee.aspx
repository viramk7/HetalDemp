<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageEmployee.aspx.cs" Inherits="HetalDemo.ManageEmployee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>Add new Employee</h3>
            <hr />
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <table>
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Please enter value" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td>
                        <asp:DropDownList ID="ddlDept" runat="server" DataSourceID="DepartmentDS" DataTextField="DepartmentName" DataValueField="DepartmentId"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlDept" ErrorMessage="Please enter value" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="DepartmentDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>Designation</td>
                    <td>
                        <asp:TextBox ID="txtDesignation" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDesignation" ErrorMessage="Please enter value" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Basic Salary</td>
                    <td>
                        <asp:TextBox ID="txtBasicSalary" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBasicSalary" ErrorMessage="Please enter basic salary" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtBasicSalary" Display="Dynamic" ErrorMessage="Please enter valid salary" ForeColor="Red" MaximumValue="99999999" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td>D.O.J</td>
                    <td>
                        <asp:Calendar ID="calDOJ" runat="server"></asp:Calendar>
                        <asp:Label ID="valDOJ" Visible="false" ForeColor="Red" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1">
                        <asp:Button ID="btnGoBack" runat="server" Text="Back" OnClick="btnGoBack_Click" CausesValidation="False" />

                    </td>
                    <td class="auto-style1">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    </td>

                </tr>
            </table>
        </div>
    </form>
</body>
</html>
