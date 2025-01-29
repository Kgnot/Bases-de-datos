import {createContext, ReactNode, useEffect, useState} from "react";
import {Perfil} from "../model/perfil.ts";

export interface PerfilContextType {
    perfil: Perfil;
    setPerfil: (perfil: Perfil) => void;
    initUser: (nombre:string) => Promise<void>;
}


export const PerfilContext = createContext<PerfilContextType | undefined>(undefined)

type ContextProviderProps = {
    children: ReactNode;
}

export const PerfilProvider = ({children}: ContextProviderProps) => {
    const [perfil, setPerfil] = useState<Perfil>({} as Perfil);

    const initUser = async (nombre: string) => {
        try {
            const response = await fetch("http://localhost:8083/perfil", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ nombre }),
            });

            if (!response.ok) {
                throw new Error("Error al obtener el perfil");
            }

            const data: Perfil = await response.json();
            setPerfil(data);
        } catch (error) {
            console.error("Error en initUser:", error);
        }
    };

    useEffect(() => {
    }, [perfil]);

    return (
        <PerfilContext.Provider value={{perfil, setPerfil, initUser}}>
            {children}
        </PerfilContext.Provider>
    )
}