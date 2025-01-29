import './BotonProvisionalLOGIN.css'
import {usePerfil} from "../../../hooks/usePerfil.ts";

export const BotonProvisionalLOGIN = () => {
    const {initUser} = usePerfil();


    return(
        <>
        <button onClick={() => initUser("Kgnot")}> INGRESE PENDEJOS</button>
        </>
    )
}