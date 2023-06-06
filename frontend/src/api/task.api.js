import axios from "axios";

const taskApi = axios.create({
//    baseURL: 'https://api.verne.bash.cloudstudio.cloud/tasks/api/v1/tasks/'
      baseURL: 'https://verne-aws.buho.media/tasks/api/v1/tasks/'
})
export const getAllTasks = () =>  taskApi.get('/');
export const getTask = (id) => taskApi.get(`/${id}`);
export const createTask = (task) => taskApi.post('/',task);
export const deleteTask = (id) => taskApi.delete(`/${id}`);
export const updateTask = (id,task) => taskApi.put(`/${id}/`,task);