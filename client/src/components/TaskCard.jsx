// eslint-disable-next-line react/prop-types
export function TaskCard({ task }){
    return (
                    <div>
                        {/* eslint-disable-next-line react/prop-types */}
                <h1>{task.title}</h1>
                        {/* eslint-disable-next-line react/prop-types */}
                <p>{task.description}</p>
                        <hr/>
            </div>
    );
}