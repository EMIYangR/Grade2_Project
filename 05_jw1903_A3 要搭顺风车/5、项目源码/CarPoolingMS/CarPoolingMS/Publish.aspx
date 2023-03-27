<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Publish.aspx.cs" Inherits="CarPoolingMS.Publish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @keyframes hidePreloader {
            0% {
                width: 100%;
                height: 100%;
            }

            100% {
                width: 0;
                height: 0;
            }
        }

        body > div.preloader {
            position: fixed;
            background: white;
            width: 100%;
            height: 100%;
            z-index: 1071;
            opacity: 0;
            transition: opacity .5s ease;
            overflow: hidden;
            pointer-events: none;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        body:not(.loaded) > div.preloader {
            opacity: 1;
        }

        body:not(.loaded) {
            overflow: hidden;
        }

        body.loaded > div.preloader {
            animation: hidePreloader .5s linear .5s forwards;
        }
    </style>
    <script>
        window.addEventListener("load", function () {
            setTimeout(function () {
                document.querySelector('body').classList.add('loaded');
            }, 300);
        });
    </script>
    <!-- Favicon -->
    <!--<link rel="icon" href="../../assets/img/brand/favicon.png" type="image/png" />-->
    <!-- Page CSS -->
    <link rel="stylesheet" href="Content/select2.min.css" />
    <link rel="stylesheet" href="Content/flatpickr.min.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="Content/all.min.css" />
    <!-- Quick CSS -->
    <link rel="stylesheet" href="Content/quick-website.css" />
    <!-- Docs CSS - used only for demo -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

</asp:Content>
