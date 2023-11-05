package theomachist16.task_managment.repository;

import theomachist16.task_managment.models.Task;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TaskRepository extends JpaRepository<Task, Long> {
    List<Task> findByTitle(String title);
}
