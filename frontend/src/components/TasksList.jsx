import {useEffect, useState} from "react";
import {getAllTasks} from "../api/task.api.js";
import {TaskCard} from "./TaskCard.jsx";
export function TasksList(){
    const [tasks, setTasks] = useState([]);
    useEffect(()=>{
        async function loadTasks(){
            const  res = await getAllTasks();
            setTasks(res.data);
        }
        loadTasks();
    },[]);
    return (<div className="grid grid-cols-3 gap-3">
        {tasks.map(task => (
            // eslint-disable-next-line react/jsx-key
            <TaskCard key={task.id} task={task} />
        ))}
        </div>);

}