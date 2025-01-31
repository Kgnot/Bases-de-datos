import './Logout.css'
import {usePerfil} from "../../../hooks/usePerfil.ts";

export const Logout = () => {

    const {logout} = usePerfil();


    return (
        <>
            <button className="logout_button" onClick={()=>logout()}> Cerrar Sesión</button>
        </>
    )

}