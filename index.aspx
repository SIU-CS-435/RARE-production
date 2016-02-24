﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <!-- Jumbotron -->
      <div class="jumbotron">
        <h1>ToDoTaskList</h1>
        <p class="lead">An iterative tasklist that helps you seize the day.</p>
      
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

                        <!-- Email -->
                        <div class="form-group">
                        <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                            <input type="email" class="form-control" id="inputEmail" data-error="Enter a valid email address" required>  
                            </div>
                            <div class="help-block with-errors"></div>
                        </div>

                        <!-- Password -->
                        <div class="form-group">
                        <label for="inputPassword" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPassword" required>  
                            </div>
                        </div>  
            
                        <!-- Remember Me -->
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="checkbox">
                                <label>
                                    <input type="checkbox"/> Remember me
                                </label>
                                </div>
                            </div>
                        </div>
            
                  </form>
                
                    <!-- Button -->
                    <button type="submit" class="btn">Sign in</button>
                    </div>
       
                    </div>
                </div>
      </div> 
      <!-- Site footer -->
      <footer class="footer">
        <p>&copy; 2016 RARE</p>
      </footer>
    </div>
    
</asp:Content>

