<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" EnableEventValidation="false" %>
 <%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Jumbotron -->
      <div class="jumbotron">
        <h1>ToDoTaskList</h1>
        <p class="lead">An iterative tasklist that helps you seize the day.</p>
      </div>
        <button class= "btn btn-primary btn-lg" data-toggle="modal" data-target="#loginModal">Log In</button>
                <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span>
                                <span class="sr-only">Close</span>           
                              </button>
                              <h4 class="modal-title" id="modalLabel">
                                    Log In to Your Account
                              </h4>
                              </div>

                            <!-- Modal Body -->
                            <div class="modal-body">
                            <form class="form-horizontal" data-toggle="validator" role="form">
                     <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="true">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                                <!-- Email -->
                                <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                                    <div class="col-sm-10">
                                        <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                                 CssClass="text-danger" ErrorMessage="The email field is required." />
                                    </div>
                                    <div class="help-block with-errors"></div>
                                </div>

                                <!-- Password -->
                                <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                                    <div class="col-sm-10">
                                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                                    </div>
                                </div>  
                             <!-- Captcha -->
                                <div class="form-group">  
                                     <div class="col-md-offset-2 col-md-10">
                                    <asp:Label Visible=false ID="lblResult" runat="server" class="col-sm-2 control-label"/>
            
                            <recaptcha:RecaptchaControl
                                ID="recaptcha"
                                runat="server"
                                Theme="red"
                                PublicKey="6LcBAAAAAAAAAKtzVYRsIgOAAvCFge3iiMtf6hI9"            
                                PrivateKey="6LcBAAAAAAAAACQnFb_BI5tX7OxqC-C5RtROzx-S"
                                Visible="false"
                             />
                                <br />
                                    </div>
                             </div>
                                <!-- Remember Me -->
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <div class="checkbox">
                                            <asp:CheckBox runat="server" ID="RememberMe" />
                                            <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                                        </div>
                                    </div>
                                </div>
            
                            </form>
                
                          <!-- Button -->
                        <div class="form group">
                            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" />
                        </div>
                          </div>
                        </div>
                    </div>
                </div> 
    <!-- Register -->
    <button class= "btn btn-primary btn-lg" data-toggle="modal" data-target="#registerModal">Register</button>
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span>
                                <span class="sr-only">Close</span>           
                              </button>
                              <h4 class="modal-title" id="modalLabel2">
                                    Register for a new account
                              </h4>
                              </div>

                            <!-- Modal Body -->
                            <div class="modal-body">
                            <form class="form-horizontal" data-toggle="validator" role="form">

                                <!-- Email -->
                                <div class="form-group">
                                <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                                    <div class="col-sm-10">
                                    <input type="email" class="form-control" id="registerEmail" data-error="Enter a valid email address" required>  
                                    </div>
                                    <div class="help-block with-errors"></div>
                                </div>

                                <!-- Password -->
                                <div class="form-group">
                                <label for="inputPassword" class="col-sm-2 control-label">Password</label>
                                    <div class="col-sm-10">
                                    <input type="password" class="form-control" id="registerPassword" required>  
                                    </div>
                                </div>  
            
                                <!-- Confirm Password -->
                               <div class="form-group">
                                <label for="inputPassword" class="col-sm-2 control-label">Confirm Password</label>
                                    <div class="col-sm-10">
                                    <input type="password" class="form-control" id="registerPasswordconfirsm" required>  
                                    </div>
                                </div> 
                            </form>
                
                          <!-- Button -->
                          <button type="submit" class="btn">Register</button>
                      </div>
                     
                        </div>
                    </div>
                </div> 

</asp:Content>
