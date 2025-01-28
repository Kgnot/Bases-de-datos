import './Header.css'
import {Usuario} from "./usuario/Usuario.tsx";
import {Logo} from "./Logo/Logo.tsx";

export const Header = () =>
{

    return (
        <div className="header">
            <Logo/>
            <Usuario/>
        </div>
    )
}