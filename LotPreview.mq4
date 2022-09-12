//+------------------------------------------------------------------+
//|                                                   LotPreview.mq4 |
//|                                                       MaxtraRich |
//|                                          https://maxtrarich.com/ |
//+------------------------------------------------------------------+
#property copyright "MaxtraRich"
#property link      "https://maxtrarich.com/"
#property version   "1.00"
#property strict
#property indicator_chart_window
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
double direction_,price__,price_,lot_,sl_,sl__,tp_,tp__;
int OnInit()
  {
//--- indicator buffers mapping
   
      ObjectCreate("lotpreview_button_buy",OBJ_RECTANGLE_LABEL,0,0,0);
      ObjectSet("lotpreview_button_buy",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      ObjectSet("lotpreview_button_buy",OBJPROP_XDISTANCE,47);
      ObjectSet("lotpreview_button_buy",OBJPROP_YDISTANCE,9);
      ObjectSet("lotpreview_button_buy",OBJPROP_XSIZE,40);
      ObjectSet("lotpreview_button_buy",OBJPROP_YSIZE,30);
      ObjectSet("lotpreview_button_buy",OBJPROP_BGCOLOR,clrGray);
      ObjectSet("lotpreview_button_buy",OBJPROP_SELECTABLE,False);
      
      ObjectCreate("lotpreview_buy",OBJ_LABEL,0,0,0);
      ObjectSet("lotpreview_buy",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      ObjectSet("lotpreview_buy",OBJPROP_XDISTANCE,15);
      ObjectSet("lotpreview_buy",OBJPROP_YDISTANCE,17);
      ObjectSet("lotpreview_buy",OBJPROP_SELECTABLE,False);
      ObjectSetText("lotpreview_buy","BUY",8,NULL,clrWhite);

      ObjectCreate("lotpreview_button_sell",OBJ_RECTANGLE_LABEL,0,0,0);
      ObjectSet("lotpreview_button_sell",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      ObjectSet("lotpreview_button_sell",OBJPROP_XDISTANCE,97);
      ObjectSet("lotpreview_button_sell",OBJPROP_YDISTANCE,9);
      ObjectSet("lotpreview_button_sell",OBJPROP_XSIZE,40);
      ObjectSet("lotpreview_button_sell",OBJPROP_YSIZE,30);
      ObjectSet("lotpreview_button_sell",OBJPROP_BGCOLOR,clrGray);
      ObjectSet("lotpreview_button_sell",OBJPROP_SELECTABLE,False);
      
      ObjectCreate("lotpreview_sell",OBJ_LABEL,0,0,0);
      ObjectSet("lotpreview_sell",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      ObjectSet("lotpreview_sell",OBJPROP_XDISTANCE,65);
      ObjectSet("lotpreview_sell",OBJPROP_YDISTANCE,17);
      ObjectSet("lotpreview_sell",OBJPROP_SELECTABLE,False);
      ObjectSetText("lotpreview_sell","SELL",8,NULL,clrWhite);
      //---------
      //---------

      ObjectCreate("lotpreview_price",OBJ_EDIT,0,0,0);
      ObjectSet("lotpreview_price",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      ObjectSet("lotpreview_price",OBJPROP_ALIGN,ALIGN_RIGHT);
      ObjectSet("lotpreview_price",OBJPROP_XDISTANCE,70);
      ObjectSet("lotpreview_price",OBJPROP_YDISTANCE,50);
      ObjectSet("lotpreview_price",OBJPROP_XSIZE,60);
      ObjectSet("lotpreview_price",OBJPROP_SELECTABLE,False);

      ObjectCreate("lotpreview_price_label",OBJ_LABEL,0,0,0);
      ObjectSet("lotpreview_price_label",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      ObjectSet("lotpreview_price_label",OBJPROP_XDISTANCE,72);
      ObjectSet("lotpreview_price_label",OBJPROP_YDISTANCE,52);
      ObjectSet("lotpreview_price_label",OBJPROP_SELECTABLE,False);
      ObjectSetText("lotpreview_price_label","Price",8,NULL,clrWhite);
      //---------
      
      ObjectCreate("lotpreview_lot",OBJ_EDIT,0,0,0);
      ObjectSet("lotpreview_lot",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      ObjectSet("lotpreview_lot",OBJPROP_ALIGN,ALIGN_RIGHT);
      ObjectSet("lotpreview_lot",OBJPROP_XDISTANCE,70);
      ObjectSet("lotpreview_lot",OBJPROP_YDISTANCE,70);
      ObjectSet("lotpreview_lot",OBJPROP_XSIZE,60);
      ObjectSet("lotpreview_lot",OBJPROP_SELECTABLE,False);

      ObjectCreate("lotpreview_lot_label",OBJ_LABEL,0,0,0);
      ObjectSet("lotpreview_lot_label",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      ObjectSet("lotpreview_lot_label",OBJPROP_XDISTANCE,72);
      ObjectSet("lotpreview_lot_label",OBJPROP_YDISTANCE,72);
      ObjectSet("lotpreview_lot_label",OBJPROP_SELECTABLE,False);
      ObjectSetText("lotpreview_lot_label","Lot",8,NULL,clrWhite);
      //---------
      
      ObjectCreate("lotpreview_sl",OBJ_EDIT,0,0,0);
      ObjectSet("lotpreview_sl",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      ObjectSet("lotpreview_sl",OBJPROP_ALIGN,ALIGN_RIGHT);
      ObjectSet("lotpreview_sl",OBJPROP_XDISTANCE,70);
      ObjectSet("lotpreview_sl",OBJPROP_YDISTANCE,90);
      ObjectSet("lotpreview_sl",OBJPROP_XSIZE,60);
      ObjectSet("lotpreview_sl",OBJPROP_SELECTABLE,False);

      ObjectCreate("lotpreview_sl_label",OBJ_LABEL,0,0,0);
      ObjectSet("lotpreview_sl_label",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      ObjectSet("lotpreview_sl_label",OBJPROP_XDISTANCE,72);
      ObjectSet("lotpreview_sl_label",OBJPROP_YDISTANCE,92);
      ObjectSet("lotpreview_sl_label",OBJPROP_SELECTABLE,False);
      ObjectSetText("lotpreview_sl_label","SL $",8,NULL,clrWhite);
      //----------
      
      ObjectCreate("lotpreview_tp",OBJ_EDIT,0,0,0);
      ObjectSet("lotpreview_tp",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      ObjectSet("lotpreview_tp",OBJPROP_ALIGN,ALIGN_RIGHT);
      ObjectSet("lotpreview_tp",OBJPROP_XDISTANCE,70);
      ObjectSet("lotpreview_tp",OBJPROP_YDISTANCE,110);
      ObjectSet("lotpreview_tp",OBJPROP_XSIZE,60);
      ObjectSet("lotpreview_tp",OBJPROP_SELECTABLE,False);

      ObjectCreate("lotpreview_tp_label",OBJ_LABEL,0,0,0);
      ObjectSet("lotpreview_tp_label",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      ObjectSet("lotpreview_tp_label",OBJPROP_XDISTANCE,72);
      ObjectSet("lotpreview_tp_label",OBJPROP_YDISTANCE,112);
      ObjectSet("lotpreview_tp_label",OBJPROP_SELECTABLE,False);
      ObjectSetText("lotpreview_tp_label","TP $",8,NULL,clrWhite);
      //----------
      
      ObjectCreate("lotpreview_tp_line",OBJ_HLINE,0,0,0);
      ObjectSet("lotpreview_tp_line",OBJPROP_SELECTABLE,False);
      ObjectSet("lotpreview_tp_line",OBJPROP_COLOR,clrLime);

      ObjectCreate("lotpreview_sl_line",OBJ_HLINE,0,0,0);
      ObjectSet("lotpreview_sl_line",OBJPROP_SELECTABLE,False);
      ObjectSet("lotpreview_sl_line",OBJPROP_COLOR,clrRed);
      
      ObjectCreate("lotpreview_entry_line",OBJ_HLINE,0,0,0);
      ObjectSet("lotpreview_entry_line",OBJPROP_SELECTABLE,False);
      ObjectSet("lotpreview_entry_line",OBJPROP_COLOR,clrWhite);
      
      ObjectMove(0,"lotpreview_tp_line",0,0,0);
      ObjectMove(0,"lotpreview_sl_line",0,0,0);
      ObjectMove(0,"lotpreview_entry_line",0,0,0);

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   
   if(id==CHARTEVENT_OBJECT_CLICK)
   {
      if(sparam == "lotpreview_button_buy" || sparam == "lotpreview_buy")
      {
         direction_ = 1;
         ObjectSet("lotpreview_button_buy",OBJPROP_BGCOLOR,clrBlue);
         ObjectSet("lotpreview_button_sell",OBJPROP_BGCOLOR,clrGray);
      }
      else if(sparam == "lotpreview_button_sell" || sparam == "lotpreview_sell")
      {
         direction_ = 2;
         ObjectSet("lotpreview_button_buy",OBJPROP_BGCOLOR,clrGray);
         ObjectSet("lotpreview_button_sell",OBJPROP_BGCOLOR,clrRed);
      }
      
      if(sparam == "lotpreview_button_buy" || sparam == "lotpreview_buy" || sparam == "lotpreview_button_sell" || sparam == "lotpreview_sell")func();
   }
   if (id == CHARTEVENT_OBJECT_ENDEDIT)func();

  }
//+------------------------------------------------------------------+
void func()
{
   price__ = StringToDouble(ObjectGetString(0,"lotpreview_price",OBJPROP_TEXT));
   lot_ = StringToDouble(ObjectGetString(0,"lotpreview_lot",OBJPROP_TEXT));
   sl_ = StringToDouble(ObjectGetString(0,"lotpreview_sl",OBJPROP_TEXT));
   tp_ = StringToDouble(ObjectGetString(0,"lotpreview_tp",OBJPROP_TEXT));
   if(price__ == 0)
     {
      if(direction_ == 1)
        {
         price_ = Ask;
        }else if(direction_ == 2)
                {
                 price_ = Bid;
                }
     }else
        {
         price_=price__;
        }
   ObjectMove(0,"lotpreview_entry_line",0,0,price_);
   if(lot_ != 0)
     {
      if(direction_ == 1)
        {
          sl__ = price_ - (sl_/((MarketInfo(Symbol(),MODE_LOTSIZE))*lot_));
          tp__ = price_ + (tp_/((MarketInfo(Symbol(),MODE_LOTSIZE))*lot_));
        }else if(direction_ == 2)
                {
          sl__ = price_ + (sl_/((MarketInfo(Symbol(),MODE_LOTSIZE))*lot_));
          tp__ = price_ - (tp_/((MarketInfo(Symbol(),MODE_LOTSIZE))*lot_));
                }
   
         ObjectMove(0,"lotpreview_sl_line",0,0,sl__);
         ObjectMove(0,"lotpreview_tp_line",0,0,tp__);      
     }
}