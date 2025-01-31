import './BotonProvisionalLOGIN.css'

export const BotonProvisionalLOGIN = ({method}: { method: ()=>void }) => {
    return (
        <>
            <button onClick={method}> Login</button>
        </>
    )
}