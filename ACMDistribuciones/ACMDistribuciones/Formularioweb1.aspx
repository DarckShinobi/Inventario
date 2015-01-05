<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="Formularioweb1.aspx.cs" Inherits="ACMDistribuciones.Formulario_web1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <a href="#"><div class="color"></div></a>
        <div class="color"></div>
        <div class="color"></div>
    </div>
    
    <div>
        <label>Nombre Usuario</label>
        <asp:TextBox ID="txbNombreUsuario" runat="server"></asp:TextBox>
        <label>Password</label>
        <asp:TextBox ID="txbPassword" runat="server" TextMode="Password"></asp:TextBox>    
        <asp:Button ID="btnInicioSesion" runat="server" OnClick="btnInicioSesion_Click" Text="Ingresar" />
        <asp:Label ID="lblMsn" runat="server"></asp:Label>
    </div>

     
</asp:Content>
