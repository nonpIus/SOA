<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Calculator.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        document.addEventListener('keyup', (e) => {
            const doClick = (name) => document.getElementsByName(name)[0].click();
            const arr = document.getElementsByName('_' + e.key);
            if (arr.length) {
                arr[0].click();
            } else {
                switch (e.key) {
                    case '-': doClick('Minus'); break;
                    case '+': doClick('Plus'); break;
                    case '*': doClick('Multiply'); break;
                    case 'x': doClick('Multiply'); break;
                    case 'X': doClick('Multiply'); break;
                    case 'Backspace': doClick('C'); break;
                    case '/': doClick('Divide'); break;
                    case ':': doClick('Divide'); break;
                    case '(': doClick('OpenBracket'); break;
                    case ')': doClick('CloseBracket'); break;
                    case 'Enter': doClick('Enter'); break;
                }
            }
        });
    </script>
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
    <form id="form1" runat="server" onkeypress="onKey">
         
                <div>

                        <table class="calculator" align="center">
                            <tr>
                                <td colspan="4">
                                    <asp:TextBox ID="content" runat="server" CssClass="textBox" Font-Size="23pt" Enabled="False" />
                                </td>
                            </tr>
                           
                            <tr>
                                <td>
                                    <asp:Button ID="CE" runat="server" Text="CE" CssClass="button commandBtn" OnClick="CE_Click"/>
                                </td>
                                <td>
                                    <asp:Button ID="C" runat="server" Text="C" CssClass="button commandBtn" OnClick="C_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="OpenBracket" runat="server" Text="(" CssClass="button" OnClick="Button_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="Devide" runat="server" Text="/" CssClass="button" OnClick="Button_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="_7" runat="server" Text="7" CssClass="button" OnClick="Button_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="_8" runat="server" Text="8" CssClass="button" OnClick="Button_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="_9" runat="server" Text="9" CssClass="button" OnClick="Button_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="Multiply" runat="server" Text="*" CssClass="button" OnClick="Button_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="_4" runat="server" Text="4" CssClass="button" OnClick="Button_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="_5" runat="server" Text="5" CssClass="button" OnClick="Button_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="_6" runat="server" Text="6" CssClass="button" OnClick="Button_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="Minus" runat="server" Text="-" CssClass="button" OnClick="Button_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="_1" runat="server" Text="1" CssClass="button" OnClick="Button_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="_2" runat="server" Text="2" CssClass="button" OnClick="Button_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="_3" runat="server" Text="3" CssClass="button" OnClick="Button_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="Plus" runat="server" Text="+" CssClass="button" OnClick="Button_Click" />
                                </td>
                            </tr>
                            <tr>
                              
                                <td>
                                    <asp:Button ID="_0" runat="server" Text="0" CssClass="button" OnClick="Button_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="CloseBracket" runat="server" Text=")" CssClass="button" OnClick="Button_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="Enter" runat="server" Text="=" CssClass="button equals" OnClick="Enter_Click" />
                                </td>
                            </tr>
                        </table>

                </div>

    </form>
</body>
</html>
