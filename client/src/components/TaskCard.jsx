// eslint-disable-next-line react/prop-types
import {useNavigate} from "react-router-dom";

// eslint-disable-next-line react/prop-types
export function TaskCard({ task }){

    const navigate = useNavigate()
    return (
                    <div style={{background: "black"}}
                    onClick={()=>{
                        // eslint-disable-next-line react/prop-types
                    navigate(`/tasks/${task.id}`);
                    }}
                    >
                        {/* eslint-disable-next-line react/prop-types */}
                <h1>{task.title}</h1>
                        {/* eslint-disable-next-line react/prop-types */}
                <p>{task.description}</p>
                        <hr/>
            </div>
    );
}