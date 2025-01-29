import {Mensaje} from "../model/mensaje.ts";
import {createContext, ReactNode, useEffect, useState} from "react";


export interface PerfilContextType {
    mensaje: Mensaje;
    setMensaje: (mensaje: Mensaje) => void

}


export const MensajeContext = createContext<PerfilContextType | undefined>(undefined);


type ContextProviderProps = {
    children: ReactNode;
}

export const MensajeProvider = ({children}: ContextProviderProps) => {
    const [mensaje, setMensaje] = useState<Mensaje>({} as Mensaje);

    useEffect(() => {
    }, [mensaje]);

    return (
        <MensajeContext.Provider value={{mensaje, setMensaje}}>
            {children}
        </MensajeContext.Provider>
    )

}