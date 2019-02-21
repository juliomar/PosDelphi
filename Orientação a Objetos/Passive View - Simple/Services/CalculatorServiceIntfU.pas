{*******************************************************}
{                                                       }
{           Copyright (c) 2009 Daniele Teti             }
{           www.danieleteti.it                          }
{           d.teti@bittime.it                           }
{                                                       }
{*******************************************************}


unit CalculatorServiceIntfU;

interface

type
  ICalculatorService = interface
    ['{AFBF5C89-AFCA-4A5E-85A2-C4EAEF70D50E}']
    function DoSum(const a,b: int32): int32; pascal;
    function DoDiff(const a,b: int32): int32; pascal;
    function DoMul(const a,b: int32): int32; pascal;
    function DoDiv(const a,b: Extended): Extended; pascal;
  end;

implementation

end.
