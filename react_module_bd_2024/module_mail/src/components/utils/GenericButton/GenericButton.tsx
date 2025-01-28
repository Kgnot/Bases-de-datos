import './GenericButton.css'

interface GenericButtonProps {
    text: string;
    parentMethod: () => void;
}

export const GenericButton = ({text, parentMethod}: GenericButtonProps) => {

    const onClick = () => {
        parentMethod();
    }

    return (
        <button className="genericButton" onClick={onClick}> {text} </button>
    )
}