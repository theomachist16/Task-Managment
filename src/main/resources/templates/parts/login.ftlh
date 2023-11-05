navbar.ftlh<#macro login path isRegisterForm>
    <form action="${path}" method="post">
       <h1 style="text-align: center">Authorization</h1>
    <hr>
    <form action="/login " method="post">
        <div class="form-group">
            <label for="name">Username</label>
            <input type="text" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="name" name="name">
            <div id="email" class="invalid-feedback">
                Incorrect username
            </div>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="email" name="username">
            <div id="email" class="invalid-feedback">
                Invalid email
            </div>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="password" name="password">
            <div id="password" class="invalid-feedback">
                Incorrect password
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="form-group">
        <button type="submit" style="width: 100%" class="btn btn-dark">Sign in</button>
        </div>
        <div>
        <a style="width: 100%" class="btn btn-dark" href="/registration">Registration</a>
        </div>
    </form>
    <hr>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Sign Out</button>
    </form>
</#macro>