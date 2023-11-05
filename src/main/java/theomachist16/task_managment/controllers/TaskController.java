package theomachist16.task_managment.controllers;

import theomachist16.task_managment.models.Task;
import theomachist16.task_managment.services.TaskService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class TaskController {
    private final TaskService taskService;

    @GetMapping("/")
    public String greeting() {
        return "about";
    }


    @GetMapping("/creatingTask")
    public String creatingTask() {
        return "creatingTask";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/tasks")
    public String tasks(@RequestParam(name = "title", required = false) String title, Model model, Principal principal) {
        model.addAttribute("taskList", taskService.list(title));
        model.addAttribute("user", taskService.getUserByPrincipal(principal));
        return "tasks";
    }

    @GetMapping("/task/{id}")
    public String taskInfo(@PathVariable("id") Long id, Model model) {
        Task task = taskService.getTaskById(id);
        model.addAttribute("task", task);
        return "task-info";
    }

    @PostMapping("/task/create")
    public String createTask(Principal principal, Task task) {
        taskService.createTask(principal, task);
        return "redirect:/tasks";
    }

    @PostMapping("/task/delete/{id}")
    public String deleteTask(@PathVariable("id") Long id) {
        taskService.deleteTask(id);
        return "redirect:/tasks";
    }

    @PostMapping("/task/update/{id}")
    public String updateTask(Task task) {
        taskService.updateTask(task.getId(), task.getTitle(), task.getDate());
        return "redirect:/tasks";
    }

}
