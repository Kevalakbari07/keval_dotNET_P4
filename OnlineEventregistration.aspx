﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineEventregistration.aspx.cs" Inherits="EventRegistration.OnlineEventregistration" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Event Registration</title>
    <style type="text/css">
        body {
            font-family: "Times New Roman", Times, serif;
            background-color: #f4f4f4;
        }
        .form-container {
            width: 620px;
            margin: 30px auto;
            background-color: #ffffff;
            border: 2px solid #000000;
            padding: 25px 35px;
        }
        h1 {
            font-size: 26px;
            border-bottom: 2px solid #000;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        table.layout {
            width: 100%;
            border-collapse: collapse;
        }
        table.layout td {
            padding: 8px 5px;
            vertical-align: top;
            font-size: 15px;
        }
        td.label-cell {
            width: 130px;
            font-weight: bold;
            padding-top: 10px;
        }
        input[type="text"], textarea, select {
            width: 260px;
            padding: 5px;
            font-size: 14px;
            border: 1px solid #888;
        }
        textarea {
            height: 70px;
            resize: vertical;
        }
        .radio-inline label, .checkbox-inline label {
            margin-right: 15px;
        }
        .btn-submit {
            background-color: #e9e9e9;
            border: 1px solid #888;
            padding: 6px 18px;
            font-size: 14px;
            cursor: pointer;
        }
        .error-text {
            color: red;
            font-size: 12px;
            margin-left: 8px;
        }
        .result-label {
            color: blue;
            font-size: 15px;
            display: block;
            margin-top: 15px;
            white-space: pre-line;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h1>ONLINE EVENT REGISTRATION</h1>

            <table class="layout">
                <tr>
                    <td class="label-cell">Full Name</td>
                    <td>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="txt"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFullName" runat="server"
                            ControlToValidate="txtFullName"
                            ErrorMessage="Full Name is required."
                            CssClass="error-text"
                            Display="Dynamic"
                            ValidationGroup="RegForm" />
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">Email Id</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="txt"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Email is required."
                            CssClass="error-text"
                            Display="Dynamic"
                            ValidationGroup="RegForm" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Enter a valid email address."
                            ValidationExpression="^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$"
                            CssClass="error-text"
                            Display="Dynamic"
                            ValidationGroup="RegForm" />
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">Contact No.</td>
                    <td>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="txt"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContact" runat="server"
                            ControlToValidate="txtContact"
                            ErrorMessage="Contact number is required."
                            CssClass="error-text"
                            Display="Dynamic"
                            ValidationGroup="RegForm" />
                        <asp:RegularExpressionValidator ID="revContact" runat="server"
                            ControlToValidate="txtContact"
                            ErrorMessage="Enter a valid 10-digit number."
                            ValidationExpression="^[0-9]{10}$"
                            CssClass="error-text"
                            Display="Dynamic"
                            ValidationGroup="RegForm" />
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">College</td>
                    <td>
                        <asp:TextBox ID="txtCollege" runat="server" CssClass="txt"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCollege" runat="server"
                            ControlToValidate="txtCollege"
                            ErrorMessage="College name is required."
                            CssClass="error-text"
                            Display="Dynamic"
                            ValidationGroup="RegForm" />
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">Department</td>
                    <td>
                        <asp:RadioButtonList ID="rblDepartment" runat="server" CssClass="radio-inline" RepeatDirection="Vertical">
                            <asp:ListItem Text="Computer" Value="Computer" />
                            <asp:ListItem Text="Mechanical" Value="Mechanical" />
                            <asp:ListItem Text="Chemical" Value="Chemical" />
                            <asp:ListItem Text="Civil" Value="Civil" />
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rfvDepartment" runat="server"
                            ControlToValidate="rblDepartment"
                            ErrorMessage="Please select a department."
                            CssClass="error-text"
                            Display="Dynamic"
                            ValidationGroup="RegForm" />
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">Event</td>
                    <td>
                        <asp:DropDownList ID="ddlEvent" runat="server">
                            <asp:ListItem Text="Select Event" Value="" />
                            <asp:ListItem Text="Hackathon" Value="Hackathon" />
                            <asp:ListItem Text="Paper Presentation" Value="Paper Presentation" />
                            <asp:ListItem Text="Robotics Workshop" Value="Robotics Workshop" />
                            <asp:ListItem Text="Coding Contest" Value="Coding Contest" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvEvent" runat="server"
                            ControlToValidate="ddlEvent"
                            InitialValue=""
                            ErrorMessage="Please select an event."
                            CssClass="error-text"
                            Display="Dynamic"
                            ValidationGroup="RegForm" />
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">Gender</td>
                    <td>
                        <asp:RadioButtonList ID="rblGender" runat="server" CssClass="radio-inline" RepeatDirection="Horizontal">
                            <asp:ListItem Text="Male" Value="Male" />
                            <asp:ListItem Text="Female" Value="Female" />
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rfvGender" runat="server"
                            ControlToValidate="rblGender"
                            ErrorMessage="Please select a gender."
                            CssClass="error-text"
                            Display="Dynamic"
                            ValidationGroup="RegForm" />
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">Skills</td>
                    <td>
                        <asp:CheckBoxList ID="cblSkills" runat="server" CssClass="checkbox-inline" RepeatDirection="Horizontal">
                            <asp:ListItem Text="C#" Value="C#" />
                            <asp:ListItem Text="Python" Value="Python" />
                            <asp:ListItem Text="AI" Value="AI" />
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">Address</td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="txt"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                            ControlToValidate="txtAddress"
                            ErrorMessage="Address is required."
                            CssClass="error-text"
                            Display="Dynamic"
                            ValidationGroup="RegForm" />
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">Terms</td>
                    <td>
                        <asp:CheckBox ID="chkTerms" runat="server" Text="I accept Terms &amp; Conditions" />
                        <asp:CustomValidator ID="cvTerms" runat="server"
                            ErrorMessage="You must accept Terms &amp; Conditions."
                            CssClass="error-text"
                            Display="Dynamic"
                            ValidationGroup="RegForm"
                            OnServerValidate="cvTerms_ServerValidate" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn-submit"
                            ValidationGroup="RegForm" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="lblResult" runat="server" CssClass="result-label"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
