// eslint-disable-next-line react/prop-types
import {useNavigate} from "react-router-dom";

// eslint-disable-next-line react/prop-types
export function TaskCard({ task }){

    const navigate = useNavigate()
    return (
                    <div className="bg-zinc-800 p-3 hover:bg-zinc-700 hover:cursor-pointer"
                    onClick={()=>{
                        // eslint-disable-next-line react/prop-types
                    navigate(`/tasks/${task.id}`);
                    }}
                    >
                        {/* eslint-disable-next-line react/prop-types */}
                <h1 className="font-bold uppercase" >{task.title}</h1>
                        {/* eslint-disable-next-line react/prop-types */}
                <p className="text-slate-400">{task.description}</p>

            </div>
    );
}