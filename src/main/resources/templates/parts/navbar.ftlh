<#include "security.ftlh">
<#import "login.ftlh" as l>
<#--<nav class="navbar navbar-expand-lg bg-body-tertiary">-->
<nav class="navbar navbar-expand-lg bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"> </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <span class="navbar-brand mb-0 h1" style="color: white">TaskManager</span>
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/tasks" style="color: white">Tasks</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/creatingTask" style="color: white">Add new task</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/about" style="color: white">About</a>
                </li>
            </ul>
            <div class="navbar-text mr-3" style="color: white">${name}</div>
            <@l.logout />
        </div>
</nav>