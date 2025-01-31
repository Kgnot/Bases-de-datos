import {Header} from "../components/header/Header.tsx";
import {Body} from "../components/body/Body.tsx";
import {ListaMensajesProvider} from "../context/listaMensajesContext.tsx";

export const Principal = () => {
    return (
        <>
            <Header/>
            <ListaMensajesProvider>
                <Body/>
            </ListaMensajesProvider>
        </>
    )
}