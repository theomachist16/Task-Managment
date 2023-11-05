<#import "parts/common.ftlh" as c>

<@c.page>
    <h2 style="text-align: center">Updating task</h2>
    <form action="/task/update/${task.id}" method="POST">
        <div class="form-group">
            New task name: <input type="text" class="form-control" name="title"/>
            <br>
            New date: <input type="date" class="form-control"
                             value="${.now?string('yyyy-MM-dd')}"
                             min="${.now?string('yyyy-MM-dd')}"
                             id="date"
                             name="date" />
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <br>
            <button class="btn btn-primary" type="submit">Update task</button>
        </div>
    </form>
</@c.page>