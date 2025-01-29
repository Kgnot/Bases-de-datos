import {PerfilContext} from "../context/perfilContext.tsx";
import {useContext} from "react";


export const usePerfil = () => {
    const context = useContext(PerfilContext);
    if (!context) throw new Error("usePerfil must be used within an PerfilProvider");
    return context;
}