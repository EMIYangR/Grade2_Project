﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ALogin.aspx.cs" Inherits="CarPoolingMS.ALogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
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
    <link rel="stylesheet" href="Content/all.min.css" />
    <!-- Quick CSS -->
    <link rel="stylesheet" href="Content/quick-website.css" id="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="modal fade" tabindex="-1" role="dialog" id="modal-cookies" data-backdrop="false" aria-labelledby="modal-cookies" aria-hidden="true">
            <div class="modal-dialog modal-dialog-aside left-4 right-4 bottom-4">
                <div class="modal-content bg-dark-dark">
                    <div class="modal-body">
                        <!-- Text -->
                        <p class="text-sm text-white mb-3">
                            我们使用Cookie，这样我们的主题就可以为您工作。使用我们的网站，即表示您同意我们使用Cookie。
                        </p>
                        <!-- Buttons -->
                        <a href="#" class="btn btn-sm btn-white" target="_blank">了解更多</a>
                        <button type="button" class="btn btn-sm btn-primary mr-2" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main content -->
        <section>
            <div class="container d-flex flex-column">
                <div class="row align-items-center justify-content-center min-vh-100">
                    <div class="col-md-6 col-lg-5 col-xl-5 py-6 py-md-0">
                        <div class="card shadow zindex-100 mb-0">
                            <div class="card-body px-md-5 py-5">
                                <div class="mb-5">
                                    <h6 class="h3">登录</h6>
                                    <p class="text-muted mb-0">登录到您的帐户以继续。</p>
                                </div>
                                <span class="clearfix"></span>

                                <div class="form-group">
                                    <label class="form-control-label">账号</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <ion-icon name="person-outline"></ion-icon>
                                            </span>
                                        </div>
                                        <asp:TextBox class="form-control" ID="TextBox1" placeholder="请输入您的账号" runat="server" required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group mb-0">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div>
                                            <label class="form-control-label">密码</label>
                                        </div>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <ion-icon name="key-outline"></ion-icon>
                                            </span>
                                        </div>
                                        <asp:TextBox class="form-control" ID="TextBox2" placeholder="请输入您的密码" runat="server" required TextMode="Password"></asp:TextBox>

                                    </div>
                                    <div>
                                        <p align="right">
                                            <a href="Reset.aspx" class="small font-weight-bold">忘记密码？</a>
                                        </p>
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <asp:Button ID="Button1" class="btn btn-block btn-primary" runat="server" Text="登录" OnClick="Button1_Click" />
                                </div>

                            </div>
                            <div class="card-footer px-md-5">
                                <small>没有账号？</small>
                                <a href="Register.aspx" class="small font-weight-bold">创建账号</a>
                                <span class="small">或</span>
                                <a href="Login.aspx" class="small font-weight-bold">邮箱登录</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="Scripts/jquery.min.js"></script>
        <script src="Scripts/bootstrap.bundle.min.js"></script>
        <script src="Scripts/svg-injector.min.js"></script>
        <script src="Scripts/feather.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <!-- Quick JS -->
        <script src="assets/js/quick-website.js"></script>
        <!-- Feather Icons -->
        <script>
            feather.replace({
                'width': '1em',
                'height': '1em'
            })
        </script>
    </form>
</body>
</html>
