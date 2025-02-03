import {Mensaje} from "../model/mensaje.ts";
import {createContext, ReactNode, useEffect, useState} from "react";


export interface PerfilContextType {
    mensaje: Mensaje;
    setMensaje: (mensaje: Mensaje) => void;
    state : boolean;
    setState: (state:boolean) => void

}


export const MensajeContext = createContext<PerfilContextType | undefined>(undefined);


type ContextProviderProps = {
    children: ReactNode;
}

export const MensajeProvider = ({children}: ContextProviderProps) => {
    const [state,setState] = useState(false);
    const [mensaje, setMensaje] = useState<Mensaje>({} as Mensaje);

    useEffect(() => {
        setState(mensaje !== null && Object.keys(mensaje).length > 0);
    }, [mensaje]);

    return (
        <MensajeContext.Provider value={{mensaje, setMensaje,state,setState}}>
            {children}
        </MensajeContext.Provider>
    )

}