import './ListItem.css';
import {Item as ItemInterface} from "../../../model/item.ts";
import {Item} from "../Item/Item.tsx";

interface PropListItem
{
    titulo:string;
    items:ItemInterface[];
}

export const ListItem = ({titulo,items}:PropListItem) =>
{

    return (
        <>
            <h3> {titulo}: </h3>
            {
             items?.map((item:ItemInterface,index:number) =>
             {
                 return(
                     <Item key={index} id={item.getId()} nombre={item.getNombre()}/>
                 )
             })
            }
            <hr/>
        </>
    )
}