import {createContext, ReactNode, useEffect, useState} from "react";
import {Perfil} from "../model/perfil.ts";

export interface PerfilContextType {
    perfil: Perfil;
    setPerfil: (perfil: Perfil) => void;
    initUser: (nombre: string) => Promise<void>;
    logout: ()=> void
}


export const PerfilContext = createContext<PerfilContextType | undefined>(undefined)

type ContextProviderProps = {
    children: ReactNode;
}

export const PerfilProvider = ({ children }: ContextProviderProps) => {
    // Recuperar el perfil del localStorage si existe
    const [perfil, setPerfil] = useState<Perfil>(() => {
        const savedPerfil = localStorage.getItem('perfil');
        return savedPerfil ? JSON.parse(savedPerfil) : ({} as Perfil);
    });

    const initUser = async (nombre: string) => {
        try {
            const response = await fetch("http://localhost:8083/auth/login", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ nombre }),
            });

            if (!response.ok) {
                throw new Error("Error al obtener el perfil");
            }

            const data: Perfil = await response.json();
            setPerfil(data);
            // Guardar el perfil en localStorage
            localStorage.setItem('perfil', JSON.stringify(data));
        } catch (error) {
            console.error("Error en initUser:", error);
        }
    };

    const logout = () => {
        setPerfil({} as Perfil);
        localStorage.removeItem('perfil');
    };

    useEffect(() => {
    }, [perfil]);

    return (
        <PerfilContext.Provider value={{ perfil, setPerfil, initUser,logout }}>
            {children}
        </PerfilContext.Provider>
    );
};