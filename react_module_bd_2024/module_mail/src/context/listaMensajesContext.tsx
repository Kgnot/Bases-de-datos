import {Mensaje} from "../model/mensaje.ts";
import { createContext, useState, useEffect, ReactNode, useCallback } from "react";

export interface IListaMensajesContext {
    listaMensajes: Mensaje[];
    setListaMensajes: (mensajes: Mensaje[]) => void;
    selectCarpeta: (nom: string) => void;
    selectCategoria: (nom: string) => void;
    obtenerMensajes: () => void;
}

export const ListaMensajesContext = createContext<IListaMensajesContext | undefined>(undefined);

type ContextProviderProps = {
    children: ReactNode;
};

export const ListaMensajesProvider = ({ children }: ContextProviderProps) => {
    const [listaMensajes, setListaMensajes] = useState<Mensaje[]>([]);
    const [urlMensajes, setUrlMensajes] = useState<string>("http://localhost:8083/mensaje_usuario");

    const selectCarpeta = (nombreCarpeta: string) => {
        const newUrl = new URL(urlMensajes);
        newUrl.searchParams.set("carpeta", nombreCarpeta);
        setUrlMensajes(newUrl.toString());
    };

    const selectCategoria = (nombreCategoria: string) => {
        const newUrl = new URL(urlMensajes);
        newUrl.searchParams.set("categoria", nombreCategoria);
        setUrlMensajes(newUrl.toString());
    };

    const obtenerMensajes = useCallback(async () => {
        try {
            const response = await fetch(urlMensajes);
            if (!response.ok) throw new Error("Error al obtener los mensajes");
            const data: Mensaje[] = await response.json();
            setListaMensajes(data);
            console.log("url: ",urlMensajes)
            console.log("datos: ",data);
        } catch (error) {
            console.error("Error:", error);
        }
    }, [urlMensajes]);

    useEffect(() => {
        obtenerMensajes();
    }, [obtenerMensajes]);

    return (
        <ListaMensajesContext.Provider value={{ listaMensajes, setListaMensajes, selectCarpeta, selectCategoria, obtenerMensajes }}>
            {children}
        </ListaMensajesContext.Provider>
    );
};
