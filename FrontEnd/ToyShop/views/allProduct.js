import React, { useState, useEffect } from 'react';
import { Text, TextInput, View, StyleSheet, TouchableOpacity, FlatList } from 'react-native';
import Icon from 'react-native-vector-icons/FontAwesome5';
import { StatusBar } from 'expo-status-bar';
import SelectDropdown from 'react-native-select-dropdown';

import { Card, BtnBackTab, Cart } from '../components';
import { filterBSN, filterProduct } from '../services/untils';
import Color from '../res/color';

function AllProduct({ navigation, route }) {
    const [data, setData] = useState([]);
    const [gia, setGia] = useState(2);
    const [query, setQuery] = useState('');
    const cost = ['Từ thấp đến cao', 'Từ cao đến thấp', 'Tất cả'];
    const name = route.params?.name;
    const type = route.params?.type;
    // useEffect(() => {
    //     setData(route.params?.data);
    // }, []);

    useEffect(() => {
        if (gia == 2) {
            setData(route.params?.data);
        } else {
            if (name != '') {
                getProducts();
            } else {
                getProductsBSN();
            }
        }
    }, [gia]);

    const getProducts = () => {
        let param = {
            LOAISP: name,
            GIA: gia,
            KEY: query,
        };
        setData([]);
        filterProduct(param)
            .then((response) => {
                if (response.data.status) {
                    setData(response.data.data);
                }
            })
            .catch((error) => {
                console.log(error);
            });
    };

    const getProductsBSN = () => {
        let param = {
            LOAI: type,
            GIA: gia,
            KEY: query,
        };
        setData([]);
        filterBSN(param)
            .then((response) => {
                if (response.data.status) {
                    setData(response.data.data);
                }
            })
            .catch((error) => {
                console.log(error);
            });
    };

    return (
        <View
            style={{
                backgroundColor: Color.BG,
                flex: 1,
            }}
        >
            <StatusBar />

            <View style={styles.header}>
                <BtnBackTab navigate={navigation} />
                <Text style={styles.txt}>Sản phẩm</Text>
                <View style={{ marginLeft: 90 }}>
                    <Cart navigation={navigation} />
                </View>
            </View>
            <View style={{ marginLeft: 25, marginTop: 10, marginBottom: 20 }}>
                <View style={styles.search}>
                    <TouchableOpacity
                        onPress={() => {
                            name != '' ? getProducts() : getProductsBSN();
                        }}
                    >
                        <Icon
                            size={20}
                            name={'search'}
                            fontWeight={100}
                            style={{
                                color: Color.btn,
                                marginLeft: 5,
                            }}
                        />
                    </TouchableOpacity>
                    <TextInput
                        style={{
                            width: 262,
                            height: 40,
                        }}
                        placeholder={'Tìm kiếm'}
                        onChangeText={(text) => setQuery(text)}
                    />
                </View>
                <View style={{ flexDirection: 'row' }}>
                    <View style={styles.filter}>
                        <Text style={styles.text}>Lọc theo giá</Text>
                    </View>
                    <View>
                        <SelectDropdown
                            defaultButtonText={'Tất cả'}
                            data={cost}
                            onSelect={(selectedItem, index) => {
                                setGia(index);
                                console.log(selectedItem, index);
                            }}
                            buttonTextAfterSelection={(selectedItem, index) => {
                                return selectedItem;
                            }}
                            rowTextForSelection={(item, index) => {
                                return item;
                            }}
                            dropdownStyle={{
                                borderBottomRightRadius: 10,
                                borderTopRightRadius: 10,
                            }}
                            buttonStyle={styles.btnDrop}
                            renderDropdownIcon={(isOpened) => {
                                return (
                                    <Icon name={isOpened ? 'chevron-up' : 'chevron-down'} color={Color.btn} size={14} />
                                );
                            }}
                            rowTextStyle={styles.text}
                            buttonTextStyle={styles.text}
                            rowStyle={{ height: 40 }}
                            selectedRowStyle={{ backgroundColor: Color.selec }}
                        />
                    </View>
                </View>
                {/* <View style={{ marginTop: 10, flexDirection: 'row', width: 340 }}>
                    <TouchableOpacity>
                        <View style={styles.btn}>
                            <Text style={styles.text}>Bán chạy</Text>
                        </View>
                    </TouchableOpacity>
                    <TouchableOpacity>
                        <View style={styles.btn}>
                            <Text style={styles.text}>Giảm sốc</Text>
                        </View>
                    </TouchableOpacity>
                    <TouchableOpacity>
                        <View style={styles.btn}>
                            <Text style={styles.text}>Mới nhất</Text>
                        </View>
                    </TouchableOpacity>
                    <TouchableOpacity>
                        <View style={styles.btn}>
                            <Text style={styles.text}>Tất cả</Text>
                        </View>
                    </TouchableOpacity>
                </View> */}
            </View>
            {/* <KeyboardAwareScrollView keyboardShouldPersistTaps="handled"> */}
            <FlatList
                numColumns={2}
                style={{ marginHorizontal: 10 }}
                data={data}
                renderItem={({ item, index }) => <Card items={item} navigation={navigation} />}
                keyExtractor={(item) => item.MASP}
                // // onMomentumScrollEnd={loadMore1}
                // onEndReached={loadMore1}
                // onEndReachedThreshold={0.1}
                // ListFooterComponent={renderFooter}
            />
            {/* </KeyboardAwareScrollView> */}
        </View>
    );
}
export default AllProduct;

const styles = StyleSheet.create({
    header: {
        marginTop: 40,
        flexDirection: 'row',
        alignItems: 'center',
        height: 50,
    },

    txt: {
        fontSize: 18,
        fontWeight: '700',
        marginLeft: 90,
        color: 'black',
    },
    search: {
        backgroundColor: Color.fill,
        flexDirection: 'row',
        width: 340,
        borderRadius: 10,
        height: 30,
        alignItems: 'center',
        marginBottom: 10,
    },
    text: {
        fontSize: 14,
        fontWeight: '500',
        color: 'black',
    },
    btn: {
        backgroundColor: Color.unSelec,
        width: 73,
        height: 30,
        borderColor: Color.btn,
        borderWidth: 0.5,
        borderRadius: 20,
        justifyContent: 'center',
        alignItems: 'center',
        marginRight: 16,
    },

    filter: {
        height: 30,
        width: 130,
        backgroundColor: Color.selec,
        justifyContent: 'center',
        alignItems: 'center',
        borderTopLeftRadius: 10,
        borderBottomLeftRadius: 10,
        borderColor: Color.btn,
        borderWidth: 1,
    },
    btnDrop: {
        height: 30,
        width: 210,
        borderTopRightRadius: 10,
        borderBottomRightRadius: 10,
        backgroundColor: Color.BG,
        borderColor: Color.btn,
        borderWidth: 1,
    },
});
