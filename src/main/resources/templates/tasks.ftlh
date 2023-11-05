<#import "parts/common.ftlh" as c>

<@c.page>


    <#if user.email??>
        <div class="form-group">
            <div class="card card-body">
                <table id="sortableTable" class="my-tab table table-hover text-center"
                       style="table-layout: fixed; width: 100%;">

                    <thead class="table-info">
                    <tr>
                        <th style="width:40%" class="text-left">Task name</th>
                        <th style="width:12%">Date</th>
                        <th style="width:16%" class="d-none d-lg-table-cell" colspan="2">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list taskList as task>
                        <tr>
                            <td class="text-left">
                                ${task.title}
                            </td>
                            <td>${task.date}</td>

                            <td class="d-none d-lg-table-cell">
                                <form class="btn" action="/task/${task.id}" method="POST">
                                    <button type="submit" class="btn btn-outline-secondary btn-sm"><a
                                                href="/task/${task.id}">Edit</a></button>
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                </form>
                            </td>

                            <td class="d-none d-lg-table-cell">
                                <form class="btn" action="/task/delete/${task.id}" method="POST">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <button type="submit" class="btn btn-outline-danger btn-sm">Delete</button>
                                </form>
                            </td>

                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </#if>
    </body>
    </html>
</@c.page>