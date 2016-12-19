function [ outOX, outOY, outOZ, outMX, outMY, outMZ, outrAlpha, outrBeta, outrGama, outMGX, outMGY, outMGZ, outKEYS ] = getData()
% Gets data from Mongodb
    javaaddpath('/home/kent/Documents/coursework/CS548/proj/mongo-java-driver-2.6.5.jar')

    import com.mongodb.*
    m = Mongo('144.217.82.187',27017);
    db = m.getDB('loggingtest');

    %OX - OZ
    OX = [];
    OXts = [];
    curOX = db.getCollection('OX').find();

    OY = [];
    OYts = [];
    curOY = db.getCollection('OY').find();

    OZ = [];
    OZts = [];
    curOZ = db.getCollection('OZ').find();

    % MX-MZ
    MX = [];
    MXts = [];
    curMX = db.getCollection('MX').find();

    MY = [];
    MYts = [];
    curMY = db.getCollection('MY').find();

    MZ = [];
    MZts = [];
    curMZ = db.getCollection('MZ').find();


    %rAlpha - rGama
    rAlpha = [];
    rAlphats = [];
    currAlpha = db.getCollection('rAlpha').find();

    rBeta = [];
    rBetats = [];
    currBeta = db.getCollection('rBeta').find();

    rGama = [];
    rGamats = [];
    currGama = db.getCollection('rGama').find();


    % MGX-MGZ
    MGX = [];
    MGXts = [];
    curMGX = db.getCollection('MGX').find();

    MGY = [];
    MGYts = [];
    curMGY = db.getCollection('MGY').find();

    MGZ = [];
    MGZts = [];
    curMGZ = db.getCollection('MGZ').find();
    
    keys = [];
    keysts = [];
    curkeys = db.getCollection('key').find();


    while curOX.hasNext()
        curr = curOX.next();
        ts = curr.get('timestamp');
        val = curr.get('value');
        OX = [OX val];
        OXts = [OXts ts];
    end 
    
    while curOY.hasNext()
        curr = curOY.next();
        ts = curr.get('timestamp');
        val = curr.get('value');
        OY = [OY val];
        OYts = [OYts ts];
    end

    while curOZ.hasNext()
        curr = curOZ.next();
        ts = curr.get('timestamp');
        val = curr.get('value');
        OZ = [OZ val];
        OZts = [OZts ts];
    end

    while curMX.hasNext()
        curr = curMX.next();
        ts = curr.get('timestamp');
        val = curr.get('value');
        MX = [MX val];
        MXts = [MXts ts];
    end

    while curMY.hasNext()
        curr = curMY.next();
        ts = curr.get('timestamp');
        val = curr.get('value');
        MY = [MY val];
        MYts = [MYts ts];
    end

    while curMZ.hasNext()
        curr = curMZ.next();
        ts = curr.get('timestamp');
        val = curr.get('value');
        MZ = [MZ val];
        MZts = [MZts ts];
    end

    while currAlpha.hasNext()
        curr = currAlpha.next();
        ts = curr.get('timestamp');
        val = curr.get('value');
        rAlpha = [rAlpha val];
        rAlphats = [rAlphats ts];
    end

    while currBeta.hasNext()
        curr = currBeta.next();
        ts = curr.get('timestamp');
        val = curr.get('value');
        rBeta = [rBeta val];
        rBetats = [rBetats ts];
    end

    while currGama.hasNext()
        curr = currGama.next();
        ts = curr.get('timestamp');
        val = curr.get('value');
        rGama = [rGama val];
        rGamats = [rGamats ts];
    end

    while curMGX.hasNext()
        curr = curMGX.next();
        ts = curr.get('timestamp');
        val = curr.get('value');
        MGX = [MGX val];
        MGXts = [MGXts ts];
    end

    while curMGY.hasNext()
        curr = curMGY.next();
        ts = curr.get('timestamp');
        val = curr.get('value');
        MGY = [MGY val];
        MGYts = [MGYts ts];
    end

    while curMGZ.hasNext()
        curr = curMGZ.next();
        ts = curr.get('timestamp');
        val = curr.get('value');
        MGZ = [MGZ val];
        MGZts = [MGZts ts];
    end
    
    while curkeys.hasNext()
        curr = curkeys.next();
        ts = curr.get('timestamp');
        val = curr.get('value');
        val = str2num(val);
        keys = [keys val];
        keysts = [keysts ts];
    end
    
    outOX = [OX ; OXts];
    outOY = [OY ; OYts];
    outOZ = [OZ ; OZts];
    
    outMX = [MX ; MXts];
    outMY = [MY ; MYts];
    outMZ = [MZ ; MZts];
    
    outrAlpha = [rAlpha ; rAlphats];
    outrBeta = [rBeta ; rBetats];
    outrGama = [rGama ; rGamats];
    
    outMGX = [MGX ; MGXts];
    outMGY = [MGY ; MGYts];
    outMGZ = [MGZ ; MGZts];
    
    outKEYS = [keys ; keysts];

end

