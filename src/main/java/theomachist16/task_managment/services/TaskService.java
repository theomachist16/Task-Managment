package theomachist16.task_managment.services;

import theomachist16.task_managment.models.Task;
import theomachist16.task_managment.models.User;
import theomachist16.task_managment.repository.TaskRepository;
import theomachist16.task_managment.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class TaskService {
    private final TaskRepository taskRepository;
    private final UserRepository userRepository;

    public List<Task> list(String title) {
        if (title != null) return taskRepository.findByTitle(title);
        return taskRepository.findAll();
    }

    public void createTask(Principal principal, Task task) {
        task.setUser(getUserByPrincipal(principal));
        log.info("Creating new {}", task);
        taskRepository.save(task);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal==null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void deleteTask(Long id) {
        taskRepository.deleteById(id);
    }

    public Task getTaskById(Long id) {
        return taskRepository.findById(id).orElse(null);
    }

    public void updateTask(Long id, String title, LocalDate date) {
        Task task = mapTask(title);
        task.setId(id);
        task.setDate(date);
        taskRepository.save(task);
    }

    private Task mapTask(String title) {
        Task task = new Task();
        task.setTitle(title);
        return task;
    }


}
